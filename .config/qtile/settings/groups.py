from libqtile.config import Group, Match

group_settings = [
    (
        "1",
        {
            "label": "\uf668",
            "layout": "monadwide",
            "matches": [Match(wm_class=["Code", "VSCodium", "jetbrains-idea", "jetbrains-toolbox"])]
        }
    ),
    (
        "2", 
        {
            "label": "\uf489",
            "layout": "max",
            "matches": [Match(wm_class=["Alacritty"])]
        }
    ),
    (
        "3",
        {
            "label": "\uf269",
            "layout": "max",
            "matches": [Match(wm_class=["brave-browser","Chromium","firefox"])] 
        }
    ),
    (
        "4",
        {
            "label": "\uf198",
            "layout": "max",
            "matches": [Match(wm_class=["Slack"])]
        }
    ),
    (
        "5",
        {
            "label": "\uf947",
            "layout": "max"
        }
    ),
    (
        "6",
        {
            "label": "\uf11b",
            "layout": "max",
            "matches": [Match(wm_class=["steam","lutris"])]
        }
    ),
]

exports = [Group(name, **kwargs) for name, kwargs in group_settings]
