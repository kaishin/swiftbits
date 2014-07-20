def sanitize_posts(options = { :abridged => true })
  FileList.new("#{temp_dir_path}/*.md").each do |post|
    body = File.read(post)
    File.open(post, "w") {
      |file| file.puts options[:abridged] ? abridged_post_body(body, post) : full_post_body(body, post)
    }
  end
end

def full_post_body(body, post)
  comment_runtime_errors(body)
  title = post_title(post).titleize

  remove_frontmatter(body)
  remove_links(body)
  add_metadata(body, post)
  add_title(body, title)
end

def abridged_post_body(body, post)
  comment_runtime_errors(body)
  title = post_title(post).titleize
  code_summary = code_summary_from_body(body)

  add_metadata(code_summary, post)
  add_title(code_summary, title)
end

def remove_frontmatter(body)
  body.gsub!(/^---(.|\n)*---\n{2}/, "")
end

def add_title(body, title)
  body.prepend("# #{title}\n")
end

def add_metadata(body, post)
  body.prepend("**Link:** [Online tutorial](#{base_url}##{post_title(post)})<br>**Author:** Reda Lemeden ([@kaishin](https://twitter.com/kaishin))\n\n")
end

def comment_runtime_errors(body)
  body.gsub!(/(.*)(\ )(\/\/.)(-->.*error.*)/, '/* \1 */')
end

def remove_links(body)
  body.gsub(/(\[)(.*)(\])(\()(.*)(\))/, '\2')
end

def code_summary_from_body(body)
  content_array = body.scan(/((?<=~{3}swift\n).*)|(\#{3}\ .*)/)
  content_array = content_array.map { |array|
    value = array[1] || array[0]
    value << "\n"
    value.scan(/\#{3}/)[0] ? value.prepend("\n") : value
  }

  content = content_array.join.gsub!(/(\#{3}\ )(.*)/, '// \2')
  content.prepend("~~~swift") << ("~~~")
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
