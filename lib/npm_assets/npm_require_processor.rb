module NpmAssets
  class NpmRequireProcessor < Sprockets::DirectiveProcessor
    
    def process_require_npm_directive(path)
      process_require_directive(path)
    end
  end
end