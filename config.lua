CONFIG = {
    JUSTABIT = 1e-10,
    INPUTS = {
        UP = "w",
        DOWN = "s",
        LEFT = "a",
        RIGHT = "d",
        JUMP = "space",
        SHOOT = "e",
        VIEW_SHOOT_LEFT = "left",
        VIEW_SHOOT_RIGHT = "right",
        VIEW_SHOOT_TOP = "up",
        VIEW_SHOOT_DOWN = "down",
        SWITCH = "r"
    },
    PLAYER = {
        WIDTH = 32,
        HEIGHT = 32,
        SPEED = 64,
        JUMPFORCE = 210,
        GRAVITY = 256,
    },
    HUMAN = {
        ACTIVE_SPRITE = "assets/human/active-idle.png",
        INACTIVE_SPRITE = "assets/human/inactive-idle.png"
    },
    ROBOT = {
        ACTIVE_SPRITE = "assets/robot/active-idle.png",
        INACTIVE_SPRITE = "assets/robot/inactive-idle.png"
    },
    WORLD = {
        TILES = 32,
    },
    BULLET = {
        SPEED = 512,
    }
}
