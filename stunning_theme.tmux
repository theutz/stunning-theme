#!/usr/bin/env bash

#  ╭──────────────────────────────────────────────────────────╮
#  │                 Status Formats & Styles                  │
#  ╰──────────────────────────────────────────────────────────╯

#  Colors
#  ────────────────────────────────────────────────────────────

tmux set -g @color-session "magenta"
tmux set -g @color-window "green"
tmux set -g @color-pane "cyan"
tmux set -g @color-text "black"
tmux set -g @color-inactive "#717C7C"
tmux set -g @color-inactive-bg "terminal"
tmux set -g @color-active-bg "terminal"
tmux set -g @color-selection "orange"
tmux set -g @color-success "green"
tmux set -g @color-warning "yellow"
tmux set -g @color-danger "red"

#  Icons
#  ────────────────────────────────────────────────────────────

tmux set -g @cap-hard-start ""
tmux set -g @cap-hard-end ""
tmux set -g @cap-soft-start ""
tmux set -g @cap-soft-end ""

tmux set -g @icon-separator "󰇙"

tmux set -g @icon-session "󱃷"
tmux set -g @icon-window "󱂬"
tmux set -g @icon-pane ""

#  Reused styles
#  ────────────────────────────────────────────────────────────

tmux set -g @window-flags "\
#[bright]\
#{?window_marked_flag,󰓏 ,}\
#{?window_zoomed_flag,󱉶 ,}\
#{?window_bell_flag,󰵙 ,}\
#{?window_last_flag,󱞱 ,}\
#{?window_activity_flag,󰛄 ,}\
#{?window_silence_flag,󰪓 ,}\
#[nobright]"
tmux set -g @window-status-format "#{@icon-window} #I #{E:@window-flags}#{@cap-soft-end} #W "

#  ╭──────────────────────────────────────────────────────────╮
#  │                         Options                          │
#  ╰──────────────────────────────────────────────────────────╯

tmux set -g message-command-style "bg=#{@color-danger} fg=#{@color-text}"
tmux set -g message-style "bg=#{@color-warning} fg=#{@color-text}"
tmux set -g pane-active-border-style "fg=#{@color-pane} bg=#{@color-active-bg}"
tmux set -g pane-border-format "#[align=right]\
#{?pane_dead,#[fg=red],#{?pane_last,#[fg=#{@color-pane}],}}\
 #{?pane_active,#{@cap-hard-start}#[reverse],#[italics]#{@cap-soft-start}}\
 #{@icon-pane} #P #{@cap-soft-end}\
 #{?pane_dead,󰱮 ,󰉋 #{pane_current_path}\
 #{@icon-separator}\
 󰆍 #{pane_current_command}}\
 #{?pane_active,#[default]#{?pane_dead,#[fg=red],}#{@cap-hard-end},#{@cap-soft-end}}\
 #{?pane_marked,󰓏  , }"
tmux set -g pane-border-indicators colour
tmux set -g pane-border-lines normal
tmux set -g pane-border-status top
tmux set -gF pane-border-style "fg=#{@color-inactive} bg=#{@color-inactive-bg}"

tmux set -g popup-border-lines "rounded"
tmux set -gF popup-border-style "bg=#{@color-inactive-bg}"
tmux set -gF popup-style ""

tmux set -g remain-on-exit-format "#[align=centre fill=#{@color-danger} bg=#{@color-danger} italics] 󰱮  This pane is #[bold underscore]dead#[nounderscore nobold]  󰱮 #[default]"

tmux set -g status-interval 1
tmux set -g status-justify absolute-centre

tmux set -g status-left "#{@cap-hard-start}#[reverse] #{@icon-session}  #S#{?session_marked, 󰓏 ,} #{@cap-soft-end} 󱞞 #{b:session_path} #[default]#{@cap-hard-end}"
tmux set -g status-left-length 80

tmux set -g status-position bottom

tmux set -g status-right "\
#{?#(ping -c 1 -t 2 google.com; echo $?),#[bg=#{@color-active-bg} fg=#{@color-danger}]#[push-default],}\
#{@cap-hard-start}#[reverse]\
 󰀄 #{user}\
 #{@cap-soft-start}\
 #(ping -c 1 -t 2 google.com 2>&1 > /dev/null && echo '󰍹' || echo '󰖪')\
 #H\
 #[default]#{@cap-hard-end}#[pop-default]"
tmux set -g status-right-length 80

tmux set -g status-style "fg=#{@color-session} bg=terminal"

tmux set -g window-status-activity-style "bg=#{color-warning} fg=#{@color-text}"
tmux set -g window-status-bell-style "fg=#{@color-danger} fg=#{@color-text}"
tmux set -g window-status-last-style "fg=#{@color-window}"
tmux set -g window-status-current-format "\
#{@cap-hard-start}\
#[bg=#{@color-window} fg=#{@color-text}]\
 #{E:@window-status-format}\
#[default]\
#{@cap-hard-end}"
tmux set -g window-status-current-style "fg=#{@color-window}"
tmux set -g window-status-format "#{@cap-soft-start} #{E:@window-status-format}#{@cap-soft-end}"
tmux set -gF window-status-separator " #[fg=#{@color-window}]⋅#[default] "
tmux set -g window-status-style "bg=#{@color-inactive-bg} italics"

tmux set -g window-active-style "bg=#{@color-active-bg}"
tmux set -g window-style "bg=#{@color-inactive-bg}"
