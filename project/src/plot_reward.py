import numpy as np
import matplotlib.pyplot as plt

# Load the data from ppo.txt
data = np.loadtxt('./record/ppo.txt')

# Plot the data
plt.figure()
plt.plot(data)
plt.xlabel('Index')
plt.ylabel('Value')
plt.title('Data from ppo.txt')
plt.show()

