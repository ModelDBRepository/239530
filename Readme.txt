DESCRIPTION OF THE PROGRAMS CONTAINED IN THE ZIP FILE

The program “Addestramento sinapsi.m” can be used to train the
synapses of the two channels, starting from an initial condition in
which the network is completely naïve, i.e., all synapses entering the
Go and NoGo parts have the same value (these values can be assigned in
lines 33-66). The dopamine level during training can be set in line
71.
After training, the synapses at different epochs of training are
stored in a data file named “W_tot_new. mat” together with the
positions of rewards, punishments and no-responses, and the dopamine
level used.  It is recommended that the user renames this file to
maintain the results.
During training the program calls the function
“BG_model_function_Ach.m” which simulates the dynamics of the basal
ganglia during training. The standard deviation of noise can be
assigned in line 174 of this function.
The results can be plotted through the program
“plot_addestrameno_sinapsi.m” which, in line 6, loads the previous
data.

The other programs perform the simulations to generate Figures 2-9 in
the publication. It is worth noting that these programs load the
synapses contained in the file “W_tot_new_W0e5_D1e0.mat”. The latter
were obtained by simulating a previous training with dopamine level
set at 1.0, and starting from a naïve network with initial synapses in
the striatum equal to 0.5. A severe Parkinsonian subject is simulated
using synapses after 100 epochs, a normal subject using synapses after
150 (or 200) epochs.
It is worth noting that the programs that generate Figures 2-9 call
the function “BG_model_function_tapping_mauro.m” which simulates the
finger tapping task (i.e., the inputs to the two channels alternate,
with a certain delay between a movement and the subsequent one). This
test is performed without noise (see lines 147 and 151).

In particular the program “Figure6_learning_vs_Levodopa.m”, performs
the simulations necessary to generate Figure 6. This program calls the
program “calcola_levodopa.m” (line 56) to simulate the effect of
levodopa injection on the patient. Then, it executes some further
trainings (50 epochs each) at different moments after levodopa
injection, by calling the program
“Addestramento_sinapsi_senzaW.m”. The latter differs from
“Addestramento.sinapsi.m” since the values of synapses are not
assigned in lines 33-66, but derived from the previous simulation.
