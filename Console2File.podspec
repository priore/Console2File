Pod::Spec.new do |s|
    s.name             = "Console2File"
    s.version          = "1.0.0"
    s.summary          = "Console2File to log even when a device is not connected to Xcode."

    s.homepage         = "https://github.com/priore/Console2File"
    s.license          = 'MIT'
    s.authors          = { 'Danilo Priore' => 'support@prioregroup.com' }
    s.source           = { :git => "https://github.com/priore/Console2File.git", :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/danilopriore'

    s.swift_version = '4.0'
    s.platform     = :ios, "10.0"
    s.ios.deployment_target = '10.0'
    s.requires_arc = true
    s.source_files = 'Console2File/Classes/*.swift'
end
