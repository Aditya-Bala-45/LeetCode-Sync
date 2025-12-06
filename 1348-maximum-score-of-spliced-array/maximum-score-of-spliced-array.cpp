class Solution {
public:
    int maximumsSplicedArray(vector<int>& nums1, vector<int>& nums2) {
        int n=nums1.size();
        vector<vector<int>>dp(n,vector<int>(3,0));
        dp[0][0]=nums1[0];
        dp[0][1]=nums2[0];
        
        for(int i=1;i<n;i++){
            dp[i][0]=dp[i-1][0]+nums1[i];
            dp[i][1]=max(dp[i-1][0],dp[i-1][1])+nums2[i];
            dp[i][2]=max(dp[i-1][1],dp[i-1][2])+nums1[i];
        }
        vector<vector<int>>dp1(n,vector<int>(3,0));
        dp1[0][0]=nums2[0];
        dp1[0][1]=nums1[0];
        
        for(int i=1;i<n;i++){
            dp1[i][0]=dp1[i-1][0]+nums2[i];
            dp1[i][1]=max(dp1[i-1][0],dp1[i-1][1])+nums1[i];
            dp1[i][2]=max(dp1[i-1][1],dp1[i-1][2])+nums2[i];
        }
        int ans=max({dp1[n-1][0],dp1[n-1][1],dp1[n-1][2],dp[n-1][0],dp[n-1][1],dp[n-1][2]});
        return ans;
    }
};