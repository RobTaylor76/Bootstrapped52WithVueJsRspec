require 'net/http'
require 'net/https'
module API
  class Rest

    class << self

      def get(url, headers)
        request_type = Net::HTTP::Get
        make_request(request_type, url, nil, headers)
      end

      def patch(url, body, headers)
        request_type = Net::HTTP::Patch
        make_request(request_type, url, body, headers)
      end

      def post(url, body, headers)
        request_type = Net::HTTP::Post
        make_request(request_type, url, body, headers)
      end

      def make_request(request_type, url, body, headers)

        begin
          uri = URI(url)
          http = Net::HTTP.new(uri.host, uri.port) #, 'localhost', 8080)
          http.use_ssl = (uri.scheme == "https")

          #http = Net::HTTP.new(uri.host, uri.port) , 'localhost', 8080)
          # if uri.scheme == "https"  # enable SSL/TLS
          #   http.use_ssl = true
          #   # Only needed for ruby 1.8.6
          #   # http.enable_post_connection_check = true
          #   http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          #   http.ca_file = File.join(File.dirname(__FILE__), "owasp_zap_root_ca.cer")
          # end


          req = request_type.new(uri,
                                 headers
          )

          req.body = body

          res = http.request(req)
          response = res.body

          {
            status: res.code.to_i,
            response: response
          }
        rescue => e
          raise
        end
      end
    end

    # def self.deep_copy(o)
    #   Marshal.load(Marshal.dump(o))
    # end
  end
end
