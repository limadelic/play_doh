def root_dir
  File.join(File.dirname(__FILE__), '../..')
end

def load_file(name)
  load "#{root_dir}/spec/fixtures/#{name}.rb"
end