module Crystal::Docs
  class  GitConfig
    @project : String
    @owner : String

    def initialize
      output = MemoryIO.new
      Process.run("git remote show origin", shell: true, output: output)

      if output.to_s.empty?
        puts "Whoops...  The current dir is not a Git repository."
        exit(1)
      end

      url = output.to_s.match(/Fetch URL: (.*)\.git/) || [] of String
      parts = url[1].split("/")

      @project = parts.pop
      @owner = parts.pop.split(":").pop
    end

    def project
      @project
    end

    def owner
      @owner
    end
  end
end
