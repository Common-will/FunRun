import React, { useEffect, useState } from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, ActivityIndicator } from 'react-native';

// In a real mobile app on an emulator, 'localhost' might need to be 10.0.2.2 (Android) or your machine's IP.
const API_URL = 'http://localhost:3000';

export default function App() {
  const [message, setMessage] = useState('Connecting to backend...');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(API_URL)
      .then((response) => response.text())
      .then((data) => {
        setMessage(data);
        setLoading(false);
      })
      .catch((error) => {
        console.error(error);
        setMessage('Failed to connect to backend.');
        setLoading(false);
      });
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>FunRun Mobile</Text>
      {loading ? (
        <ActivityIndicator size="large" color="#0000ff" />
      ) : (
        <Text style={styles.status}>Backend Status: {message}</Text>
      )}
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  status: {
    fontSize: 16,
    color: '#333',
  },
});

