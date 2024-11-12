import numpy as np
import matplotlib.pyplot as plt

ave_reward = np.load('ave_reward.npy')

# Find the cutoff point for the non-zero values
nonzero_indices = np.nonzero(ave_reward)[0]
if len(nonzero_indices) > 0:
    cutoff_index = nonzero_indices[-1] + 1  # last non-zero value index + 1
    ave_reward_nonzero = ave_reward[:cutoff_index]
else:
    ave_reward_nonzero = ave_reward  # In case there are no non-zero values

# Plot the non-zero portion of ave_reward
plt.plot(ave_reward_nonzero)
plt.xlabel("Time Steps")
plt.ylabel("Average Reward")
plt.title("Average Reward (Non-zero values)")
plt.show()
