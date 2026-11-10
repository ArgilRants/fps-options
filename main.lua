local default_fps_opt = 5
fpsopt_config = get_compressed("config/fpsopts.jkr") + 0
if fpsopt_config == nil then 
    compress_and_save("config/fpsopts.jkr", default_fps_opt)
end
fpsopt_fps_opt = fpsopt_config or 5
G.ARGS.fps_vals = {30, 60, 120, 240, 500}

G.FPS_CAP = G.ARGS.fps_vals[fpsopt_fps_opt]

ml_fps_opt = {"30", "60", "120", "240", "500 [Max]"}
b_set_fps = "FPS"

--@param args {cycle_config: table, to_key: key}
G.FUNCS.change_fps = function(args)
    G.ARGS.fps_vals = G.ARGS.fps_vals or {30, 60, 120, 240, 500}
    G.SETTINGS.QUEUED_CHANGE.fps = G.ARGS.fps_vals[args.to_key]
    fpsopt_fps_opt = args.to_key
end