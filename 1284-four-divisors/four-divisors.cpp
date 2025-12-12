class Solution {
public:
    int sumFourDivisors(vector<int>& nums) {
       int n=100000;
       int x=nums.size();
       vector<int>div_Sum(n+1,1);
       vector<int>div(n+1);

        for(int i=2;i<=n;i++){
            for(int j=i;j<=n;j+=i){
                div[j]++;
            }
        }
        for(int i=2;i<=n;i++){
            for(int j=i;j<=n;j+=i){
                div_Sum[j]+=i;
            }
        }
        int ans=0;
        for(int i=0;i<x;i++){
            if(div[nums[i]]==3){
                ans+=div_Sum[nums[i]];
            }
        }
        return ans;
    }
};