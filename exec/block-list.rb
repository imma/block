#!/usr/bin/env ruby

require 'json'

def git_defaults ele
  # If username/repo, default to github.com
  if %r{^(\w+)/}.match(ele)
    "git@github.com:#{ele}"
  else
    # If just name, default to github.com:imma
    "git@github.com:imma/#{ele}"
  end
end

def block_list nm_block, info_block, reqs, ordered
  unless File.directory? info_block[:path]
    reqs[nm_block] = info_block
    ordered << nm_block
    return reqs
  end

  Dir.chdir(info_block[:path])

  # Block names can be overridden with `.block-name` for repos that don't clone
  # into a directory of the same name, for example home directories.
  if File.exists? ".block-name"
    nm_block = File.read(".block-name").strip 
  end

  # Record the block info
  reqs[nm_block] = info_block

  reqs = 
    if File.exists? "Blockfile.json"
      block = JSON.load(File.read("Blockfile.json"))
      if ENV['BLOCK_NO_SITE'].nil? && File.exists?("Blockfile.json.site")
        site = JSON.load(File.read("Blockfile.json.site"))
        block["require"] += Array(site["require"])
      end

      block["require"].inject([]) {|acc, ele|
        # Flatten the .require
        acc += Array(ele)
      }.inject([]) {|acc, ele|
        # Map the block names to git repos, defaulting to github.com or
        # github.com:imma
        git = if block["blocks"]
          if block["blocks"].member? ele
            block["blocks"][ele]
          end
        end || git_defaults(ele)
        acc << [ ele, git ]
      }
    else
      []
    end.inject(reqs) {|acc, ele_git|
      ele, git = ele_git
      nm_work = ele.split('/')[-1]
      pth_dep = "#{ENV['BLOCK_PATH']}/#{nm_work}"

      acc.member?(ele) ? acc :
        block_list(ele, {
            name: ele,
            git: git,
            path: pth_dep
          }, acc, ordered)
    }

  # The block is ordered after its dependencies
  ordered << nm_block

  reqs
end

def main
  # Block order, dependencies are first
  ordered = []

  reqs = block_list(File.basename(Dir.pwd), {
      git: %x{git ls-remote --get-url}.strip,
      path: Dir.pwd,
      end: "."
    }, {}, ordered)

  ordered.each {|ele|
    puts "#{ele} #{reqs[ele][:path]} #{reqs[ele][:git]} #{reqs[ele][:end] || ""}"
  }
end

main
