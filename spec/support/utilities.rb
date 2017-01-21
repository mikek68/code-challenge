def load_json(dir)
  JSON.parse(load_file(dir))
end

def load_yaml(dir)
  YAML.load_file(dir)
end

def load_file(dir)
  File.read(dir)
end

def load_fixture(dir)
  File.read(Rails.root.join('spec', 'fixtures', dir))
end
