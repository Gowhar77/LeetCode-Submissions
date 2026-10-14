class Solution {
public:
    vector<int> searchRange(vector<int>& nums, int target) 
    {
       int left = findBound(nums, target, true);
        int right = findBound(nums, target, false);
        return {left, right};
        
    }
    private:
    int findBound(vector<int>& nums, int target, bool isFirst) {
        int l = 0, r = nums.size() - 1;
        int ans = -1;
        while (l <= r) {
            int mid = l + (r - l) / 2;
            if (nums[mid] == target) {
                ans = mid;
                if (isFirst) r = mid - 1; // go left
                else l = mid + 1; // go right
            } else if (nums[mid] < target) {
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return ans;
    }
 
        
    
};