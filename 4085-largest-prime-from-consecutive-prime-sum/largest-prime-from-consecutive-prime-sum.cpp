class Solution {
public:
    int largestPrime(int n) {
      vector<bool>prim(500001,true);
      for(int i=2;i*i<500001;i++){
        if(prim[i]){
            for(int j=i*i;j<500001;j+=i){
                prim[j]=false;
            }
        }
      }
      vector<int>primNum;
      long long sum=0;
      for(int i=2;i<=500000;i++){
        if(prim[i]){
            sum+=i;
            if(sum>500000)break;
            if(prim[sum])
            primNum.push_back(sum);
        }
      }
      auto it=upper_bound(primNum.begin(),primNum.end(),n)-primNum.begin();
      it--;
      if(n==1)return 0;
      else return primNum[it];
    }
};