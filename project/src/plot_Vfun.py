import numpy as np
import matplotlib.pyplot as plt
import re

# Read the file and extract values using regular expressions
with open('./record/complex_env_basic_reward_ppo/V_fun.txt', 'r') as file:
    # Use regular expressions to find numbers inside 'tensor(...)'
    data = [float(re.search(r'[-+]?\d*\.\d+|\d+', line).group()) for line in file]

# Convert to numpy array
data = np.array(data)

# Plot the data
plt.plot(data)
plt.xlabel('Index')
plt.ylabel('Value')
plt.title('Data from V_fun.txt')
plt.show()

