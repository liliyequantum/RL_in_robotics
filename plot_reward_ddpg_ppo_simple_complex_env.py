import numpy as np
import matplotlib.pyplot as plt

# Helper function to average every 10 values
def average_every_n(data, n=10):
    return np.mean(data[:len(data) // n * n].reshape(-1, n), axis=1)

ave_reward = np.load('./ddpg/src/results/ddpg_simple_env_basic_reward/record/ave_reward.npy')
# Find the cutoff point for the non-zero values
nonzero_indices = np.nonzero(ave_reward)[0]
if len(nonzero_indices) > 0:
    cutoff_index = nonzero_indices[-1] + 1  # last non-zero value index + 1
    ave_reward_nonzero = ave_reward[:cutoff_index]
else:
    ave_reward_nonzero = ave_reward  # In case there are no non-zero values
ave_reward_ddpg_simple = ave_reward_nonzero
ave_reward_ddpg_simple_avg_10 = average_every_n(ave_reward_nonzero, 10)

ave_reward = np.load('./ddpg/src/results/ddpg_complex_env_basic_reward/record/ave_reward.npy')
# Find the cutoff point for the non-zero values
nonzero_indices = np.nonzero(ave_reward)[0]
if len(nonzero_indices) > 0:
    cutoff_index = nonzero_indices[-1] + 1  # last non-zero value index + 1
    ave_reward_nonzero = ave_reward[:cutoff_index]
else:
    ave_reward_nonzero = ave_reward  # In case there are no non-zero values
ave_reward_ddpg_complex = ave_reward_nonzero
ave_reward_ddpg_complex_avg_10 = average_every_n(ave_reward_nonzero, 10)

ave_reward_ppo_simple = np.loadtxt('./project/src/record/simple_env_basic_reward_ppo/ppo.txt')
ave_reward_ppo_complex = np.loadtxt('./project/src/record/complex_env_basic_reward_ppo/ppo.txt')
ave_reward_ppo_simple_avg_10 = average_every_n(ave_reward_ppo_simple, 10)
ave_reward_ppo_complex_avg_10 = average_every_n(ave_reward_ppo_complex, 10)

# Plot the non-zero portion of ave_reward
plt.figure()
plt.plot(ave_reward_ppo_simple,label='PPO',linewidth=1,color='dodgerblue',alpha=0.8)
plt.plot(ave_reward_ddpg_simple,label='DDPG',linewidth=1,color='tab:orange',alpha=0.8)
plt.plot(np.arange(0, len(ave_reward_ppo_simple), 10),ave_reward_ppo_simple_avg_10,\
         color='tab:blue', alpha=1)
plt.plot(np.arange(10, len(ave_reward_ddpg_simple), 10),ave_reward_ddpg_simple_avg_10,\
         color='tab:red', alpha=1)
plt.legend(fontsize=18)
plt.ylim([-5,15])
plt.xlabel("Episodes",fontsize = 18)
plt.ylabel("Average Reward", fontsize = 18)
plt.tick_params(labelsize=18)  # Set tick label size for both axes
plt.title("4 x 4 Simple Env")
plt.tight_layout()
plt.savefig('./simple_env_ave_reward_plot.png', format='png', dpi=300)  # Saves as a PNG file with 300 DPI
plt.show()


# Plot the non-zero portion of ave_reward
plt.figure()
plt.plot(ave_reward_ppo_complex,label='PPO',linewidth=1,color='dodgerblue',alpha=0.8)
plt.plot(ave_reward_ddpg_complex,label='DDPG',linewidth=1,color='tab:orange',alpha=0.8)
plt.plot(np.arange(10, len(ave_reward_ppo_complex), 10),ave_reward_ppo_complex_avg_10,\
         color='tab:blue',alpha=1)
plt.plot(np.arange(10, len(ave_reward_ddpg_complex), 10),ave_reward_ddpg_complex_avg_10,\
         color='tab:red',alpha=1)
plt.legend(fontsize=18)
plt.ylim([-15,15])
plt.xlabel("Episodes",fontsize = 18)
plt.ylabel("Average Reward", fontsize = 18)
plt.tick_params(labelsize=18)  # Set tick label size for both axes
plt.title("4 x 4 Complex Env")
plt.tight_layout()
plt.savefig('./complex_env_ave_reward_plot.png', format='png', dpi=300)  # Saves as a PNG file with 300 DPI
plt.show()
