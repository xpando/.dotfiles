from libqtile import bar, widget
from settings.theme import colors

primary = bar.Bar(
    [
        widget.GroupBox(
            font='Iosevka Term',
            fontsize=38,
            highlight_method = "line",
            center_aligned=True,
            active=colors['green'],
            inactive=colors['gray'],
            this_current_screen_border=colors['blue'],
            urgent_color=colors['red'],
            urgent_border=colors['red'],
            rounded = False,
            borderwidth=4,
            spacing=5
        ),
        #widget.Prompt(),
        widget.TaskList(
            borderwidth=0,
            font='Iosevka',
            fontsize=18
        ),
        #widget.Mpd(),
        #widget.Volume(update_interval=2),
        widget.ThermalSensor(),
        widget.CPUGraph(
            line_width=1,
            type='linefill',
            fill_color=colors['green'] + '.3',
            graph_color=colors['green'],
            border_color=colors['black']),
        widget.MemoryGraph(
            line_width=1,
            type='linefill',
            fill_color=colors['blue'] + '.3',
            graph_color=colors['blue'],
            border_color=colors['black']),
       widget.NetGraph(
           line_width=1,
           type='linefill',
           fill_color=colors['magenta'] + '.3',
           graph_color=colors['magenta'],
           border_color=colors['black'],
           interface='auto'),
        #widget.Wlan(interface="wlp2s0"),
        #widget.TextBox('|'),
        #widget.Battery(),
        #widget.TextBox('|'),
        widget.Systray(),
        widget.Clock(format='%a %b %d %I:%M %p'),
        widget.CurrentLayoutIcon(),
    ],
    40,
    background=colors['background'],
)

secondary = bar.Bar(
    [
        widget.GroupBox(
            active=colors['green'],
            this_current_screen_border=colors['yellow'],
            urgent_color=colors['magenta'],
            urgent_border=colors['magenta'],
            borderwidth=1),
        widget.CurrentLayoutIcon(),
        widget.Prompt(),
    ],
    32,
    background=colors['background'],
)
