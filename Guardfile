guard 'rspec', cmd: 'rspec' do
  # watch /lib/files
  watch(%r{^spec/(.+).rb$}) do |m|
    "spec"
  end

  # watch /spec/ files
  watch(%r{^lib/(.+).rb$}) do |m|
    "spec"
  end
end
