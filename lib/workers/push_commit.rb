require File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), "pagoda/helper"))


class PushCommitWorker
  include Sidekiq::Worker

  def perform
    # Figure out how to include the common functions from helper to here.
    repo_path = File.expand_path("../../../", __FILE__) + "/tmp/repo"
    git_opts  = {:raise=>true, :timeout=>false, :chdir => repo_path, :rebase => true}

    repo = Grit::Repo.new(repo_path) 
    Dir.chdir(repo_path)

    #repo.git.push(git_opts, ["origin"])
    data = repo.git.pull({}, "origin", "gh-pages")
    repo.git.push(git_opts, ["origin"], 'gh-pages')
  end
end