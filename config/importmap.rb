# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'slim-select', to: 'https://ga.jspm.io/npm:slim-select@2.5.0/dist/slimselect.es.js'
pin 'sortablejs', to: 'https://ga.jspm.io/npm:sortablejs@1.15.0/modular/sortable.esm.js'
pin 'moment', to: 'https://ga.jspm.io/npm:moment@2.29.4/moment.js'
pin 'stimulus-use', to: 'https://ga.jspm.io/npm:stimulus-use@0.52.0/dist/index.js'
pin 'mapkick/bundle', to: 'mapkick.bundle.js'
pin 'dropzone', to: 'https://ga.jspm.io/npm:dropzone@6.0.0-beta.2/dist/dropzone.mjs'
pin 'just-extend', to: 'https://ga.jspm.io/npm:just-extend@5.1.1/index.esm.js'
pin '@rails/activestorage', to: 'https://ga.jspm.io/npm:@rails/activestorage@7.0.3-1/app/assets/javascripts/activestorage.esm.js'
