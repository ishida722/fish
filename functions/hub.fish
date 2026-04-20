function hub --description "Hub Agent: tmux セッションを起動して Hub Agent (Claude Code) を開く"
    set HUB_DIR "$HOME/hub"
    set SESSION "main"
    set WINDOW "hub"

    # tmux セッションが存在するか確認
    if tmux has-session -t "$SESSION" 2>/dev/null
        # セッションあり → hub ウィンドウが存在するか確認
        if tmux list-windows -t "$SESSION" -F "#{window_name}" 2>/dev/null | grep -qx "$WINDOW"
            # hub ウィンドウあり → アタッチしてそのウィンドウに移動
            if test -n "$TMUX"
                tmux switch-client -t "$SESSION"
                tmux select-window -t "$SESSION:$WINDOW"
            else
                tmux attach-session -t "$SESSION" \; select-window -t "$WINDOW"
            end
        else
            # hub ウィンドウなし → 新規作成して Claude Code 起動
            tmux new-window -t "$SESSION" -c "$HUB_DIR" -n "$WINDOW" "claude"
            if test -n "$TMUX"
                tmux switch-client -t "$SESSION"
                tmux select-window -t "$SESSION:$WINDOW"
            else
                tmux attach-session -t "$SESSION"
            end
        end
    else
        # セッションなし → セッションごと新規作成
        tmux new-session -d -s "$SESSION" -c "$HUB_DIR" -n "$WINDOW" "claude"
        tmux attach-session -t "$SESSION"
    end
end
