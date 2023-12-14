# Secure Key sharing with Quantum Key Distribution Protocol - BBM92 #

## Using quantum entanglement as a security application in a real world scenario ##

This is a simple Q# program build around a real world scenario for a quantum key distribution protocol called the ''' BBM92 protocol''' . This protocol allows two parties to generate a shared secret key securely, using the principles of quantum mechanics to detect eavesdropping attempts.

In this real-world scenario, Champ (Sender) and Pakaya (Reciver) would typically be physically separated and communicate over a network. Quantum Key Distribution (QKD) protocols are designed to establish a shared secret key between two parties securely, even in the presence of a potential eavesdropper.

In this code, Champ prepares an entangled state and randomly measures one of the qubits. Pakaya measures the other qubit. They then compare their measurement results to detect any potential eavesdropping. If their measurements match, a secure key is established.

## Here's a high-level overview of how this QKD protocol work in action ##

### Libraries ###
        Microsoft.Quantum.Intrinsic

### Quantum Channel ###
Champ and Pakaya have a quantum channel between them, which could be implemented using fiber optic cables or other quantum communication technologies.

### Classical Communication Channel ###
In addition to the quantum channel, Champ and Pakaya also have a classical communication channel, which can be used for exchanging classical information.

### Key Exchange Protocol ###
Champ performs the quantum entanglement operations locally and sends the qubits (quantum bits) to Pakaya over the quantum channel.

        operation BBM92Protocol() : (Result, Result) {
       
        use qubit1 = Qubit();
        use qubit2 = Qubit();
        H(qubit1);
        CNOT(qubit1, qubit2);

Pakaya receives the qubits, performs the necessary quantum operations on his end, and measures the qubits.

        let measurementPakaya = M(qubit2);


Both Champ and Pakaya communicate the basis used for their measurements over the classical channel.

Champ and Pakaya compare a subset of their measurement results over the classical channel to check for discrepancies. If the measurements match, it indicates the absence of eavesdropping, and they proceed to use the matching results as a secure shared key.

         // Run the BBM92 Protocol
         
        let (resultChamp, resultPakaya) = BBM92Protocol();

        // Check if measurements match (secure key)
        if (resultChamp == resultPakaya) {
            Message("Secure key established!");
        } else {
            Message("Eavesdropping detected! Abort key exchange.");
        }


If discrepancies are detected, it may indicate eavesdropping, and they may decide to abort the key exchange or take appropriate actions.

### Secure Communication ###
Once the secure key is established, Champ and Pakaya can use it to encrypt their classical communication over the classical channel. This shared key can be used with symmetric-key encryption algorithms to encrypt and decrypt messages.

In this way, the quantum communication establishes a secure key between Champ and Pakaya, and the classical communication is used to exchange information about the quantum measurements and to verify the security of the key.

### Additional complexities ###
Dealing with noise. 
Loss in quantum channels.
Error correction techniques.

Overall, QKD protocols provide a way to generate secure shared keys for encrypting classical communication, making them potentially useful for secure communication in a quantum-secure network.
