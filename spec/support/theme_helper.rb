RSpec.shared_context "theme context" do
  def read_stylesheet(path)
    file_path = ::File.join(::File.dirname(__FILE__), '../../vendor/assets/stylesheets', path)
    if ::File.exist?(file_path)
      ::File.open(file_path).read
    else
      ""  # Return empty string for non-existent files (like IE CSS)
    end
  end
end

RSpec.shared_examples "theme" do
  let (:src) { %Q~<html><head>head<title>title</title></head><body>body</body></html>~ }
  let (:out) { %Q~<html><head>head<title>title</title></head><body>body</body></html>~ }
  it "inserts env mark" do
    expect(subject.insert_into(src, 'env', revision: 'rev', timestamp: 'time')).to eq(out)
  end
end
