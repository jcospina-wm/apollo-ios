Pod::Spec.new do |s|
  s.name         = 'Apollo'
  s.version      = `scripts/get-version.sh`
  s.author       = 'Meteor Development Group'
  s.homepage     = 'https://github.com/apollographql/apollo-ios'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.summary      = "A GraphQL client for iOS, written in Swift."

  s.source       = { :git => 'https://github.com/cjospina-wm/apollo-ios.git', :branch => 'mml' }

  s.requires_arc = true

  s.swift_version = '5.0'

  s.default_subspecs = 'Core'

  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.14'
  s.tvos.deployment_target = '12.0'
  s.watchos.deployment_target = '5.0'

  s.subspec 'Core' do |ss|
    ss.source_files = 'Sources/Apollo/*.swift','Sources/ApolloCore/*.swift'
    ss.preserve_paths = [
      'scripts/run-bundled-codegen.sh',
    ]
  end

  # Apollo provides exactly one persistent cache out-of-the-box, as a reasonable default choice for
  # those who require cache persistence. Third-party caches may use different storage mechanisms.
  s.subspec 'SQLite' do |ss|
    ss.source_files = 'Sources/ApolloSQLite/*.swift'
    ss.dependency 'Apollo/Core'
    ss.dependency 'SQLite.swift', :git => 'git@github.com:jcospina-wm/SQLite.swift.git'
  end

  # Websocket and subscription support based on Starscream
  s.subspec 'WebSocket' do |ss|
    ss.source_files = 'Sources/ApolloWebSocket/*.swift'
    ss.dependency 'Apollo/Core'
    ss.dependency 'Starscream', '~>4.0.4'
  end

end
