#!/usr/bin/env ruby

require 'rubygems'
require 'jabbot'

if RUBY_VERSION >= "1.9"
    # Encoding patch
    require 'socket'
    class TCPSocket
        def external_encoding
            Encoding::BINARY
        end
    end

    require 'rexml/source'
    class REXML::IOSource
        alias_method :encoding_assign, :encoding=
        def encoding=(value)
            encoding_assign(value) if value
        end
    end

    begin
        # OpenSSL is optional and can be missing
        require 'openssl'
        class OpenSSL::SSL::SSLSocket
            def external_encoding
                Encoding::BINARY
            end
        end
    rescue
    end
end

configure do |conf|
  y = YAML::load(File.open("config/application.yml"))
  env = ENV['ENV'] || 'scripps-dev'
  
  conf.login = y[env]['login']
  conf.channel = y[env]['channel']
  conf.server = y[env]['server']
  conf.password = y[env]['password']

  names = y['names']
  conf.nick = names[rand(names.length)]
end

$LOAD_PATH << './lib'

require 'listener'
Listener.start
#require 'twitter'
#Twitter.start
