function fvim
    set base_dir ~/Texts  # 起点ディレクトリを指定
    set file (fd --type f . $base_dir | fzf)
    if test -n "$file" -a -f "$file"
        nvim "$file"
    end
end



