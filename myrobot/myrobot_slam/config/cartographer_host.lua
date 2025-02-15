include "map_builder.lua"
include "trajectory_builder.lua"

options = {

    map_builder = MAP_BUILDER,
    trajectory_builder = TRAJECTORY_BUILDER,
    map_frame = "map",
    --  The ROS frame ID of the frame that is tracked by the SLAM algorithm. If an IMU
    --  is used, it should be at its position, although it might be rotated. A common
    --  choice is "imu_link".
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
    odometry_sampling_ratio = 1,
    fixed_frame_pose_sampling_ratio = 1,
    imu_sampling_ratio = 1,
    landmarks_sampling_ratio = 1,
    num_point_clouds = 0,
    lookup_transform_timeout_sec = 0.2, 
    submap_publish_period_sec = 0.3, 
    pose_publish_period_sec = 5e-3, 
    trajectory_publish_period_sec = 30e-3, 
}

MAP_BUILDER.use_trajectory_builder_2d = true 

TRAJECTORY_BUILDER_2D.min_range = 0.2 
TRAJECTORY_BUILDER_2D.max_range = 8
TRAJECTORY_BUILDER_2D.missing_data_ray_length = 0 

TRAJECTORY_BUILDER_2D.use_imu_data = false 
TRAJECTORY_BUILDER_2D.submaps.grid_options_2d.resolution = 0.05 
TRAJECTORY_BUILDER_2D.motion_filter.max_angle_radians = math.rad(0.2) 
TRAJECTORY_BUILDER_2D.num_accumulated_range_data = 1 
TRAJECTORY_BUILDER_2D.submaps.num_range_data = 60 

-- LOCAL --

TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true 

TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.linear_search_window = 0.1 
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.angular_search_window = math.rad(20.) 
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.translation_delta_cost_weight = 10.0 
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.rotation_delta_cost_weight = 1 -- ситуацию никак не изменило 

TRAJECTORY_BUILDER_2D.submaps.range_data_inserter.probability_grid_range_data_inserter.hit_probability = 0.55 
TRAJECTORY_BUILDER_2D.submaps.range_data_inserter.probability_grid_range_data_inserter.miss_probability = 0.49 


-- GLOBAL --

POSE_GRAPH.optimize_every_n_nodes = 10 

POSE_GRAPH.constraint_builder.sampling_ratio = 0.3 

POSE_GRAPH.constraint_builder.max_constraint_distance = 15. 

POSE_GRAPH.constraint_builder.min_score = 0.65 

POSE_GRAPH.constraint_builder.global_localization_min_score = 0.75 
POSE_GRAPH.constraint_builder.loop_closure_translation_weight = 1.1e3 
POSE_GRAPH.constraint_builder.loop_closure_rotation_weight = 1e4 -- ситуацию никак не изменило
POSE_GRAPH.constraint_builder.log_matches = false 

POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher.linear_search_window = 7. 

POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher.linear_search_window = math.rad(20.) 
POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher.branch_and_bound_depth = 7 

POSE_GRAPH.constraint_builder.ceres_scan_matcher.occupied_space_weight = 20 
POSE_GRAPH.constraint_builder.ceres_scan_matcher.translation_weight = 10. 
POSE_GRAPH.constraint_builder.ceres_scan_matcher.rotation_weight = 1. -- ситуацию никак не изменило
--POSE_GRAPH.constraint_builder.ceres_scan_matcher.translation_weight = 5. 
--POSE_GRAPH.constraint_builder.ceres_scan_matcher.rotation_weight = 1. -- ситуацию никак не изменило
POSE_GRAPH.constraint_builder.ceres_scan_matcher.ceres_solver_options.use_nonmonotonic_steps = true 
POSE_GRAPH.constraint_builder.ceres_scan_matcher.ceres_solver_options.max_num_iterations = 10 
POSE_GRAPH.constraint_builder.ceres_scan_matcher.ceres_solver_options.num_threads = 1 

POSE_GRAPH.matcher_translation_weight = 5e2 
POSE_GRAPH.matcher_rotation_weight = 1.6e3 -- ситуацию никак не изменило

POSE_GRAPH.optimization_problem.huber_scale = 1e1 
POSE_GRAPH.optimization_problem.acceleration_weight = 0 
POSE_GRAPH.optimization_problem.rotation_weight = 0 -- ситуацию никак не изменило 
POSE_GRAPH.optimization_problem.local_slam_pose_translation_weight = 1e5 

POSE_GRAPH.optimization_problem.local_slam_pose_rotation_weight = 1e10 -- ситуацию никак не изменило
POSE_GRAPH.optimization_problem.odometry_translation_weight = 1e5 

POSE_GRAPH.optimization_problem.odometry_rotation_weight = 0 -- ситуацию никак не изменило
POSE_GRAPH.optimization_problem.fixed_frame_pose_translation_weight = 1e1 
POSE_GRAPH.optimization_problem.fixed_frame_pose_rotation_weight = 1e2 -- ситуацию никак не изменило
POSE_GRAPH.optimization_problem.log_solver_summary = false 

POSE_GRAPH.optimization_problem.ceres_solver_options.use_nonmonotonic_steps = false 
POSE_GRAPH.optimization_problem.ceres_solver_options.max_num_iterations = 50 
POSE_GRAPH.optimization_problem.ceres_solver_options.num_threads = 7 

POSE_GRAPH.max_num_final_iterations = 200 
POSE_GRAPH.global_sampling_ratio = 0.003 
POSE_GRAPH.log_residual_histograms = false 
POSE_GRAPH.global_constraint_search_after_n_seconds = 10.

return options