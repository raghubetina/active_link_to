# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'active_link_to/version'

Gem::Specification.new do |s|
  s.name          = "active_link_to"
  s.version       = ActiveLinkTo::VERSION
  s.authors       = ["Oleg Khabarov"]
  s.email         = ["oleg@khabarov.ca"]
  s.homepage      = "https://github.com/comfy/active_link_to"
  s.summary       = "ActionView helper to render currently active links"
  s.description   = "Helpful method when you need to add some logic that figures out if the link (or more often navigation item) is selected based on the current page or other arbitrary condition"
  s.license       = "MIT"

  s.files         = `git ls-files`.split("\n")

  s.required_ruby_version = ">= 3.4"
  s.metadata = {
    "source_code_uri" => "https://github.com/comfy/active_link_to",
    "changelog_uri" => "https://github.com/comfy/active_link_to/blob/master/CHANGELOG.md"
  }

  s.add_dependency "actionpack", ">= 7.2", "< 9.0"
  s.add_dependency "addressable", ">= 2.8", "< 3.0"
end
