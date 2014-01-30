namespace :npm_assets do
  
  desc "go thru all the coffee files, look for require_npm and add dependencies to package.json"
  task :build_package_json => :environment do
    npms = []
    FileList["app/assets/javascripts/**/*.coffee", "spec/javascripts/**/*.coffee",
             "app/assets/javascripts/**/*.js", "spec/javascripts/**/*.js"].each do |f|
      require_matcher = f.ends_with?("coffee") ? /^#=\s+require_npm\s+([\w_-]*)/ : /^\/\/=\s+require_npm\s+([\w_-]*)/
      File.new(f).each_line do |line|
        match = line.match(require_matcher)
        npms << match[1] if match
      end
    end
    puts npms.inspect
    if File.exist?("package.json")
      pkg = ActiveSupport::JSON.decode(File.read("package.json"))
    else
      pkg = {"name" => Rails.application.class.parent.to_s, "version" => "0.0.1", "dependencies" => {}}
    end
    npms.each do |npm|
      pkg["dependencies"][npm] = "*" unless pkg["dependencies"].keys.include?(npm)
    end
    File.open("package.json", "w")  { |f| f.puts pkg.to_json }
  end
  
  desc "run npm install"
  task :install => :build_package_json do
    exec "npm install"
  end
end

