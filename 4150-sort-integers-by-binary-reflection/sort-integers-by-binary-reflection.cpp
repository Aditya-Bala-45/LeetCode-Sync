class Solution {
public:
    string decToBin(int n){
        string s="";
        while(n>0){
            s+='0'+n%2;
            n/=2;
        }
        reverse(s.begin(),s.end());
        return s;
    }
    int binToDec(string s){
        int n=s.size();
        int num=0;
        for(int i=0;i<n;i++){
            if(s[i]=='1'){
                num+=1<<i;
            }
        }
        return num;
    }
    string binRef(string s){
        reverse(s.begin(),s.end());
        return s;
    }

    vector<int> sortByReflection(vector<int>& nums) {
        int n=nums.size();
        vector<pair<int,int>>v;
        for(int i=0;i<n;i++){
            string t1=decToBin(nums[i]);
            // string t2=binRef(t1);
            int x=binToDec(t1);
            v.push_back({x,nums[i]});
        }
        sort(v.begin(),v.end());
        vector<int> ans;
        for(int i=0;i<n;i++){
            ans.push_back(v[i].second);
        }
        return ans;
    }
};