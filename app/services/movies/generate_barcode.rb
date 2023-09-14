class Movies::GenerateBarcode
  include Rails.application.routes.url_helpers
  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/ascii_outputter'
  require 'barby/outputter/png_outputter'

  attr_reader :movie, :barcode

  def initialize(movie)
    @movie = movie
  end

  def call
    barcode_url = generate_url

    @barcode = Barby::Code128B.new(barcode_url)

    png = generate_barcode_as_png

    image_name = SecureRandom.hex

    IO.binwrite("tmp/barcodes/#{image_name}.png", png.to_s)

    @movie.barcode.attach(io: File.open("tmp/barcodes/#{image_name}.png"), filename: "#{image_name}.png",
                          content_type: 'image/png')
  end

  private

  def generate_url
    url_for(controller: 'movies',
            action: 'show',
            id: @movie.id,
            only_path: false,
            host: 'localhost:3000',
            source: 'barcode')
  end

  def generate_barcode_as_png
    Barby::PngOutputter.new(@barcode).to_png
  end
end
