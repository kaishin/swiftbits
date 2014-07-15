def sanitize_posts
  FileList.new("#{temp_dir_path}/*.md").each do |post|
    body = File.read(post)
    File.open(post, "w") {
      |file| file.puts sanitize_post_body(body, post)
    }
  end
end

def sanitize_post_body(body, post)
  title = post_title(post).titleize
  remove_frontmatter(body, title)
  comment_runtime_errors(body)
  return remove_links(body)
end

def remove_frontmatter(body, title)
  body.gsub!(/^---(.|\n)*---/, "# " + title)
end

def comment_runtime_errors(body)
  body.gsub!(/(.*)(\ )(\/\/.)(<--.*)/, '\3\1')
end

def remove_links(body)
  body.gsub(/(\[)(.*)(\])(\()(.*)(\))/, '\2')
end

def post_title(post)
  post_filename(post).chomp(post_extension(post))
end

def post_extension(post)
  File.extname(post)
end

def sanitized_post_filename(post)
  post_filename(post).gsub(/\d{4}-\d{2}-\d{2}-/, '')
end

def post_filename(post)
  Pathname.new(post).basename.to_s
end
