def generate_playgrounds
  %x{playground #{temp_dir} -d #{playgrounds_dir}}
end

def prepare_posts
  copy_posts
  sanitize_posts
end

def copy_posts
  FileList.new("source/posts/*.md").each do |post|
    copy_post(post)
  end
end

def copy_post(post)
  FileUtils.copy_file post, "#{temp_dir}/#{sanitized_post_filename(post)}"
end
