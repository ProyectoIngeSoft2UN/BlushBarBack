# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::Parser, :parsers => {
  'application/json' => proc { |body| MyCustomJsonEngine.do_it body },
  'application/xml'  => proc { |body| MyCustomXmlEngine.decode body },
  'application/roll' => proc { |body| 'never gonna give you up'     }
}
