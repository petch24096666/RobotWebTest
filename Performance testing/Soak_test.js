import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '5m', target: 20 }, // Stage 1
    { duration: '5m', target: 30 }, // Stage 2
    { duration: '5m', target: 10 }, // Stage 3
  ],
};

export default function () {
  // Test logic here
  let res = http.get('http://45.144.164.182:8080/');
  check(res, {
     'is status 200': (r) => r.status === 200,
     'body size is 11,105 bytes': (r) => r.body.length == 11105,
  });
  sleep(1);
}