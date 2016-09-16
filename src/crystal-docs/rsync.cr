module Crystal::Docs
  module Rsync
    def self.copy(username, project_name)
      system("rsync -r #{Dir.current}/doc/* #{username}@publish.crystal-docs.org:#{project_name}")
    end

    def self.copy(username, project_name, version)
      system("rsync -r #{Dir.current}/doc/* #{username}@publish.crystal-docs.org:#{project_name}/#{version}")
    end
  end
end
