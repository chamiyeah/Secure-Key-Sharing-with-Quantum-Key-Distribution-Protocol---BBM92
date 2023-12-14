// QuantumKeyDistribution.qs

namespace QuantumKeyDistribution {

    open Microsoft.Quantum.Intrinsic;

    // BBM92 Protocol: Champ sends qubits to Pakaya, and they perform measurements to establish a shared key.
    operation BBM92Protocol() : (Result, Result) {
        // Champ prepares an entangled state
        use qubit1 = Qubit();
        use qubit2 = Qubit();
        H(qubit1);
        CNOT(qubit1, qubit2);

 // Champ randomly measures one of the qubits
        let measurementChamp = M(qubit1);

        // Pakaya measures the other qubit
        let measurementPakaya = M(qubit2);

        // Display measurement results
        Message($"Champ's measurement: {measurementChamp}");
        Message($"Pakaya's measurement: {measurementPakaya}");

        // Release the qubits
        Reset(qubit1);
        Reset(qubit2);

        // Return the measurement results
        return (measurementChamp, measurementPakaya);
    }

    // Entry point to run the quantum key distribution protocol
    @EntryPoint()
    operation RunBBM92Protocol() : Unit {
        // Run the BBM92 Protocol
        let (resultChamp, resultPakaya) = BBM92Protocol();

        // Check if measurements match (secure key)
        if (resultChamp == resultPakaya) {
            Message("Secure key established!");
        } else {
            Message("Eavesdropping detected! Abort key exchange.");
        }
    }
}
