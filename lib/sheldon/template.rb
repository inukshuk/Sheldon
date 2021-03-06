require 'erubis'

module Sheldon
  class Template

    ROOT = File.expand_path('../../../templates', __FILE__)

    attr_accessor :name

    def self.load(name, ext = '.md.erb')
      new File.read(File.join(ROOT, "#{name}#{ext}")), name
    end

    def initialize(text, name = nil)
      @erb, @name = Erubis::Eruby.new(text), name
    end

    def render(locals = {})
      @erb.result(locals)
    end
  end
end
