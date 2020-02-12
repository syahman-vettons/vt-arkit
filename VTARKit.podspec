require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "vt-arkit"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  vt-arkit
                   DESC
  s.homepage     = "https://github.com/github_account/VTARKit"
  s.license      = "MIT"
  s.swift_version= '4.2'
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Muhammad Syahman" => "syahman@vettons.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/github_account/VTARKit.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  # ...
  # s.dependency "..."
end

