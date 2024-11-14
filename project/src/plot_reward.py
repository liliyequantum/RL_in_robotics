import numpy as np
import matplotlib.pyplot as plt

# Load the data from ppo.txt
data = np.loadtxt('./record/complex_env_basic_reward_ppo/ppo.txt')
#threshold = 20
#filtered_data = data[(data > -threshold) & (data < threshold)]

# Plot the data
plt.figure(figsize=(8,6))
plt.plot(data)
plt.xlabel('Episodes',fontsize = 18)
plt.ylabel('Ave Rewards',fontsize=18)
#plt.title('Data from ppo.txt')
plt.tick_params(labelsize=18)  # Set tick label size for both axes
plt.ylim([-5,10])
#plt.yticks([-5,0,5,10,15])
# Save the figure
plt.tight_layout()
plt.savefig('./record/complex_env_basic_reward_ppo_plot.png', format='png', dpi=300)  # Saves as a PNG file with 300 DPI

# Display the plot
plt.show()
