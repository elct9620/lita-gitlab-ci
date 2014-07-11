module Lita
  module Handlers
    class GitlabCi < Handler
    end

    Lita.register_handler(GitlabCi)
  end
end
