package JavaExample;

public class SimplerSelectionSort {
    public static void main(String[] args) {
        int arr[] = {27, 20, 18, 27, 75, 40, 57, 26, 97};
        int n = arr.length;
    
        // One by one move boundary of unsorted subarray
        for (int i = 0; i < n-1; i++) {
            // Find the minimum element in unsorted array
            int min_idx = i;
            for (int j = i+1; j < n; j++)
                if (arr[j] < arr[min_idx])
                    min_idx = j;
            // Swap the found minimum element with the first element
            int temp = arr[min_idx];
            arr[min_idx] = arr[i];
            arr[i] = temp;
        }
    }
}
