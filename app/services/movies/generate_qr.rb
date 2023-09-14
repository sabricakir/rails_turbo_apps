class Movies::GenerateQr
  include Rails.application.routes.url_helpers
  require 'rqrcode'

  attr_reader :movie, :qr_code

  def initialize(movie)
    @movie = movie
  end

  def call
    qr_code_url = generate_url

    @qr_code = RQRCode::QRCode.new(qr_code_url)

    png = generate_qr_code_as_png

    image_name = SecureRandom.hex

    IO.binwrite("tmp/qr_codes/#{image_name}.png", png.to_s)

    @movie.qr_code.attach(io: File.open("tmp/qr_codes/#{image_name}.png"), filename: "#{image_name}.png",
                          content_type: 'image/png')
  end

  private

  def generate_url
    url_for(controller: 'movies',
            action: 'show',
            id: @movie.id,
            only_path: false,
            host: 'localhost:3000',
            source: 'qr_code')
  end

  def generate_qr_code_as_png
    @qr_code.as_png(
      bit_depth: 1, border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black', file: nil,
      fill: 'white', module_px_size: 6,
      resize_exactly_to: false, resize_gte_to: false, size: 120
    )
  end
end
