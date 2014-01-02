require 'foreman_api'
require 'log_buddy'
require 'gauges'

#class Examples
  @mySmartProxy = ForemanApi::Resources::SmartProxy.new({
    :base_url => "https://foreman.yourccc.info",
    #:base_url => "http://puppetmaster-server.yourccc.info:8443",
    :oauth    => {
      :consumer_key    => "KR87xrMjsvorApsCpVrsjrBZgjc4cE9m",
      :consumer_secret => "5EBuXHGEUwXBYj4K8oRdaKKjwekSdJdL"
    }
    },{
      :headers => {
        :foreman_user => "admin"
      }
  })

  @log = Logger.new('log.txt')
  @log.debug "Log file created"

  LogBuddy.init({
      :logger   => @log, #Gauges.logger,
      #:disabled => Gauges.production?,
  })

  # @proxy ||= smartProxies.index[0].find { |s| s['smart_proxy']['name'] == resource[:name] }

  @mySmartProxy
  d { @mySmartProxy }

  @proxy = @mySmartProxy.index[0]
  d { @proxy }
  @proxy = @mySmartProxy.index[1]
  d { @proxy }
  @proxy = @mySmartProxy.index[2]
  d { @proxy }

  # @proxy = @mySmartProxy.index[0].find { |s| s['smart_proxy']['name'] == "puppetmaster-server.yourccc.info" }

  # d { @proxy }

  # proxy ? proxy['smart_proxy']['id'] : nil
  #@id = @proxy ? @proxy['smart_proxy']['id'] : nil

  # Delete
  #@mySmartProxy.destroy({'id' => @id})
  # @proxy = nil

  @fqdn = Socket.gethostbyname(Socket.gethostname).first
  # d @fqdn
  # d ["https://", @fqdn, ":8443"].join("")

  # Create
  @createResult = @mySmartProxy.create({
     'smart_proxy' => {
         'name' => @fqdn,
         # 'url'  => "http://google.de:84443"
         'url'  => ["https://", @fqdn, ":8443"].join("")
         #'url'  => "https://foreman.yourccc.info"
     }
  })

  d { @createResult }




#end