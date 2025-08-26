require 'spec_helper'

describe Rack::DevMark::Theme::GithubForkRibbon do
  include_context "theme context"
  it_behaves_like "theme" do
    let :out do
      s = <<-EOS
<html><head>head<title>title</title><style>#{read_stylesheet "github-fork-ribbon-css/gh-fork-ribbon.css"}</style></head><body><a class="github-fork-ribbon left-top red" data-ribbon="env" title="rev&#10;time" onClick="this.style.display='none'">env</a>body</body></html>
      EOS
      s.strip
    end

    subject { Rack::DevMark::Theme::GithubForkRibbon.new }
  end
  context "position option" do
    it_behaves_like "theme" do
      let :out do
        s = <<-EOS
<html><head>head<title>title</title><style>#{read_stylesheet "github-fork-ribbon-css/gh-fork-ribbon.css"}</style></head><body><a class="github-fork-ribbon  red" data-ribbon="env" title="rev&#10;time" onClick="this.style.display='none'">env</a>body</body></html>
        EOS
        s.strip
      end

      subject { Rack::DevMark::Theme::GithubForkRibbon.new(position: 'right') }
    end
  end
  context "color option" do
    it_behaves_like "theme" do
      let :out do
        s = <<-EOS
<html><head>head<title>title</title><style>#{read_stylesheet "github-fork-ribbon-css/gh-fork-ribbon.css"}</style></head><body><a class="github-fork-ribbon left-top orange" data-ribbon="env" title="rev&#10;time" onClick="this.style.display='none'">env</a>body</body></html>
        EOS
        s.strip
      end

      subject { Rack::DevMark::Theme::GithubForkRibbon.new(color: 'orange') }
    end
  end
  context "fixed option" do
    it_behaves_like "theme" do
      let :out do
        s = <<-EOS
<html><head>head<title>title</title><style>#{read_stylesheet "github-fork-ribbon-css/gh-fork-ribbon.css"}</style></head><body><a class="github-fork-ribbon left-top fixed red" data-ribbon="env" title="rev&#10;time" onClick="this.style.display='none'">env</a>body</body></html>
        EOS
        s.strip
      end

      subject { Rack::DevMark::Theme::GithubForkRibbon.new(fixed: true) }
    end
  end
end
