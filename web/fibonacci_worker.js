async function fibonacciIterative(n) {
    if (n <= 1) return n;
    let a = 0, b = 1;
    for (let i = 2; i <= n; i++) {
      const temp = a + b;
      a = b;
      b = temp;

      // 進捗状況を定期的に報告
      if (i % 1000000 === 0) {
        self.postMessage({ type: 'progress', value: i / n });
      }

      // メインスレッドに制御を戻す
      if (i % 1000000 === 0) {
        await new Promise(resolve => setTimeout(resolve, 0));
      }
    }
    return b;
  }

  self.onmessage = async function(e) {
    const n = e.data;
    const startTime = performance.now();

    try {
      const result = await fibonacciIterative(n);
      const endTime = performance.now();
      const duration = Math.round(endTime - startTime);

      self.postMessage({
        type: 'result',
        value: result,
        duration: duration
      });
    } catch (error) {
      self.postMessage({
        type: 'error',
        message: error.message
      });
    }
  };

  console.log('Fibonacci worker initialized');