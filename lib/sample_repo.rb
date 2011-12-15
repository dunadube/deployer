require "fileutils"
require "git"

class SampleRepo

  # Create a sample git repository 
  # with various build pipeline tags
  # set.
  def create(path)
    @path = path

    FileUtils.rm_rf(@path)
    FileUtils.mkdir_p(@path)

    @repo = Git.init(@path)

    i = 0
    private_methods.select { |mname| mname =~ /commit/ }.sort.each do |mname|
      tags = method(mname.to_sym).call 

      @repo.commit_all(mname)

      add_tags(tags, i)

      i = i+1
    end
  end

  private

  def add_file(fn)
    fullfn = @path + "/" + fn
    FileUtils.touch(fullfn)
    @repo.add(fullfn)
  end

  def add_tags(tags, seqno)
    tags.each do |tag|
      @repo.add_tag tag.to_s + "_#{seqno}"
    end
  end

  def commit_0
    add_file("file_one")
    [:build, :uat, :capacity, :rc, :released]
  end

  def commit_1
    add_file("file_two")
    [:build]
  end

  def commit_2
    add_file("file_three")
    [:build, :uat, :capacity, :rc, :released]
  end

  def commit_3
    add_file("file_four")
    [:build, :uat, :capacity, :rc]
  end

  def commit_4
    add_file("file_five")
    [:build, :uat]
  end

  def commit_5
    add_file("file_six")
    [:build, :uat, :capacity, :rc]
  end

  def commit_6
    add_file("file_seven")
    [:build, :uat]
  end

  def commit_7
    add_file("file_eight")
    [:build, :uat]
  end

  def commit_8
    add_file("file_nine")
    [:build, :uat, :capacity, :rc]
  end

  def commit_9
    add_file("file_ten")
    [:build, :uat, :capacity, :rc, :released]
  end
end
