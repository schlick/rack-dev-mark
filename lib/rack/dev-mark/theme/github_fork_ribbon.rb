# Thanks to https://github.com/simonwhitaker/github-fork-ribbon-css
require 'rack/dev-mark/theme/base'

module Rack
  module DevMark
    module Theme
      class GithubForkRibbon < Base
        def insert_into(html, env, params = {})
          revision = params[:revision]
          timestamp = params[:timestamp]

          position = @options[:position] || 'left'
          color = @options[:color] || 'red'
          fixed = @options[:fixed] ? ' fixed' : ''
          title = []
          title << revision if revision.to_s != ''
          title << timestamp if timestamp.to_s != ''
          title = title.join("&#10;")

          # Map old position names to new CSS classes
          position_class = case position
          when 'left' then 'left-top'
          when 'right' then ''  # right-top is the default
          when 'left-bottom' then 'left-bottom'
          when 'right-bottom' then 'right-bottom'
          else 'left-top'
          end

          style_tag_str = <<-EOS
#{stylesheet_link_tag "github-fork-ribbon-css/gh-fork-ribbon.css"}
          EOS

          ribbon_tag_str = <<-EOS
<a class="github-fork-ribbon #{position_class}#{fixed} #{color}" data-ribbon="#{env}" title="#{title}" onClick="this.style.display='none'">#{env}</a>
          EOS

          html
            .sub(%r{(</head>)}i, "#{style_tag_str.strip}\\1")
            .sub(%r{(<body[^>]*>)}i, "\\1#{ribbon_tag_str.strip}")
        end
      end
    end
  end
end
