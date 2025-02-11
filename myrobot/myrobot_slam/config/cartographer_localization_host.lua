include "map_builder.lua"
include "trajectory_builder.lua"

options = {

    map_builder = MAP_BUILDER,
    trajectory_builder = TRAJECTORY_BUILDER,
    map_frame = "map",
    tracking_frame = "world_link",
    published_frame = "odom",
    odom_frame = "odom",
    provide_odom_frame = false,
    use_odometry = true,
    use_nav_sat = false,
    use_landmarks = false,
    publish_frame_projected_to_2d = false,
    num_laser_scans = 1,
    num_multi_echo_laser_scans = 0,
    num_subdivisions_per_laser_scan = 1,
    rangefinder_sampling_ratio = 1,
    odometry_sampling_ratio = 1.0,
    fixed_frame_pose_sampling_ratio = 1,
    imu_sampling_ratio = 1.0,
    landmarks_sampling_ratio = 1,
    num_point_clouds = 0,
    lookup_transform_timeout_sec = 0.5,
    submap_publish_period_sec = 0.3,
    pose_publish_period_sec = 2e-2,
    trajectory_publish_period_sec = 30e-3,
}

MAP_BUILDER.use_trajectory_builder_2d = true

TRAJECTORY_BUILDER_2D.min_range = 0.2
TRAJECTORY_BUILDER_2D.max_range = 8
TRAJECTORY_BUILDER_2D.missing_data_ray_length = 0
TRAJECTORY_BUILDER_2D.use_imu_data = false
TRAJECTORY_BUILDER_2D.submaps.grid_options_2d.resolution = 0.05
TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true -- default false Whether to solve the online scan matching first using the correlative scan matcher to generate a good starting point for Ceres
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.linear_search_window = 0.1
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.translation_delta_cost_weight = 10
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.rotation_delta_cost_weight = 1e-1
TRAJECTORY_BUILDER_2D.num_accumulated_range_data = 1
TRAJECTORY_BUILDER_2D.motion_filter.max_angle_radians = math.rad(0.2)

POSE_GRAPH.optimization_problem.huber_scale = 1e2

TRAJECTORY_BUILDER.pure_localization = true -- Not yet documented
POSE_GRAPH.optimize_every_n_nodes = 1
MAP_BUILDER.num_background_threads = 6 -- Number of threads to use for background computations
POSE_GRAPH.global_sampling_ratio = 0.03
POSE_GRAPH.constraint_builder.sampling_ratio = 0.3
POSE_GRAPH.constraint_builder.min_score = 0.65

TRAJECTORY_BUILDER_2D.motion_filter.max_time_seconds = 1. -- Threshold above which range data is inserted based on time
TRAJECTORY_BUILDER_2D.motion_filter.max_distance_meters = 0.2 -- Threshold above which range data is inserted based on linear motion
TRAJECTORY_BUILDER_2D.motion_filter.max_angle_radians = math.rad(1.)

return options
