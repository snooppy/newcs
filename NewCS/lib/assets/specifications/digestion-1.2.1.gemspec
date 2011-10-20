# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "digestion"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sam Pohlenz"]
  s.date = "2011-09-28"
  s.description = "Adds asset digest configuration options to Rails so that specific paths can be excluded from fingerprinting."
  s.email = "sam@sampohlenz.com"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Fine-grained digest controls for the Rails 3.1 asset pipeline."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, ["~> 3.1.0"])
    else
      s.add_dependency(%q<actionpack>, ["~> 3.1.0"])
    end
  else
    s.add_dependency(%q<actionpack>, ["~> 3.1.0"])
  end
end
